
library("readr")
library("hash")
library("stringr")


################################
# parameters
# A set of parameters are defined so this converter can be adapted to different cases.
# We must specify what information will be taken from the file in CSV format,
# where we will leave the result and the graph type
#
# source: column number of the origin of the relationship
# target: column number of the destination of the relationship
# source_attribs: column numbers where to get the attributes
# name_attribs: names of the attributes
# name_file_csv: file name with the input data
# name_file_gdf: file name to leave the result
#directed: indicate whether the graph is directed or not
################################
source=3
target=9
source_attribs= c(5,6,11,12,13)
null_attrib=c(NA,NA,NA,NA,NA)
name_attribs=c("app","location","hastag","lang","create at")
name_file_csv<-"rstudio.csv"
name_file_gdf<-"rstudio_RTs.gdf"
directed <-TRUE
###############################
# Data
# In order to store the data, dynamic structures are needed to allow data to be
# added as they appear. The hash tables were chosen because they are the most appropriate 
# for this case. Hash tables will be used to store nodes and connections
###############################
hash_nodes <- hash()
hash_links <- hash()
hash_links_in <- hash()
hash_links_out <- hash()
hash_connections <- hash()
hash_connections_attrib<- hash()
num_attribs<-length(source_attribs)
###############################
# read source data
# Import data reading the CSV file and run it row by row to store the nodes and connections
# in the hash tables.
# Related entities can appear multiple times, as a source or as a target. When an entity appears
# for the first time, it is stored in the hash_nodes table. Attributes are associated to source
# entities and null attributes to target entities. It is a criterion that assumes this algorithm,
# but there could be others. If an entity appears first as a target as source, the null attributes
# are replaced by theirs as source.
# For each entity, the number of total links (hash_links), the number of inbound links (hash_links_in)
# and the number of outbound links (hash_links) are counted. This is done to allow ordering the nodes
# from greater to lesser degree when generating the file in GDF format.
# For each origin-target entity pair, the number of times that relation appears (hash_connections)
# and the attributes (hash_connections_attrib) are stored. In the first case, we get the weight of the
# relationship and the second we get the associated attributes
###############################
table_csv <-read_csv2(name_file_csv)

num_rows=nrow(table_csv)
num_cols=ncol(table_csv)
for (i in 1:num_rows)
{ 
  node_source <- table_csv[[i,source]]
  node_target <- table_csv[[i,target]]
  #
  # Store nodes:
  # When a source node appears for the first time it is stored in a hash table. The source node
  # is associated with its attributes and the target with null attributes.
  #
  # The following times if it is source increases the outgoing links and if it is target
  # the incoming links 
  #

  print (i)
  node_source_attribs<-null_attrib
  for (j in 1:num_attribs)
  { 
   k=source_attribs[[j]]
   raw_attrib<-table_csv[[i,k]]
   cooked_attrib<-str_replace_all(raw_attrib,",","-") 
   node_source_attribs[[j]]<-cooked_attrib
  }
  if (!(has.key(node_source, hash_nodes)))
  {
   hash_nodes[[node_source]] <- node_source_attribs
   hash_links[[node_source]] <-0
   hash_links_in[[node_source]] <-0
   hash_links_out[[node_source]] <-0
  }
  else
  {
   node_source_attribs_old=hash_nodes[[node_source]]
   if (identical(node_source_attribs_old,null_attrib)) 
     {hash_nodes[[node_source]] <- node_source_attribs}
  }
  if (!(is.na(node_target)))
  {
   if (!(has.key(node_target, hash_nodes)))
   {
    hash_nodes[[node_target]] <- null_attrib
    hash_links[[node_target]] <-0
    hash_links_in[[node_target]] <-0
    hash_links_out[[node_target]] <-0
   }
   #
   #Store connections
   #
   par_nodes=paste(node_source,node_target)
   if (!(has.key(par_nodes, hash_connections)))
   {
    hash_connections[[par_nodes]] <- 0
    hash_connections_attrib[[par_nodes]]<-node_source_attribs
   }
   hash_connections[[par_nodes]] <- hash_connections[[par_nodes]] +1
   hash_links[[node_source]] <- hash_links[[node_source]]+1
   hash_links_out[[node_source]] <- hash_links_out[[node_source]]+1
   hash_links[[node_target]] <-hash_links[[node_target]]+1
   hash_links_in[[node_target]] <-hash_links_in[[node_target]]+1
  }
}
##################################
# Order descending by connections
# The hash table object does not have the sort method, but has one to convert a hash
# table into a list. Once we have converted the hash list_links and list_connections into a list,
# we sort them down by number of connections.
##################################
list_links=as.list.hash(hash_links )
list_link_order = list_links[order(unlist(list_links), decreasing=TRUE)]
list_connections=as.list.hash(hash_connections )
list_connections_order = list_connections[order(unlist(list_connections), decreasing=TRUE)]
#################################
# Prepare the data for the GDF format
# In this step we place in GDF format nodes and links in descending order by number 
# of connections
# In the GDF format, the only data required for the definition of nodes is the name of the node,
# but attributes can be added. In this case, three fixed attributes are included, which are the
# total number of links, the number of inbound links and the number of outbound links. Since the
# GDF format is readable, these attributes allow getting an idea of the most relevant nodes even 
# before importing them into Gephi. The attributes configured in the parameters are also added.
#The information of the nodes is stored in a matrix sized in rows by the number of nodes and in columns
# by the number of tributes configured plus four.
# For the definition of links only the source and target nodes are required, but we can also expand
# with attributes. In this case we add the weight of the relation, a boolean variable to indicate 
# if the graph is directed or not (by default it is not directed) and the attributes configured
# in the parameters.
# The information of the links is stored in a matrix dimensioned in rows by the number of pairs of
# connections and in columns by the number of attributes configured plus four.
#################################
num_nodes=length(list_links)
table_nodes = matrix(nrow=num_nodes,ncol=num_attribs+4)
num_nodes_connected <-0
for(i in 1:num_nodes) 
{
  name_node=names(list_link_order)[i]
  if (hash_links[[name_node]] >0)
  {
   num_nodes_connected <- num_nodes_connected+1
   table_nodes[i,1]<-name_node
   table_nodes[i,2]<-hash_links[[name_node]]
   table_nodes[i,3]<-hash_links_in[[name_node]]
   table_nodes[i,4]<-hash_links_out[[name_node]]
   node_attrib<-hash_nodes[[name_node]]
   for (j in 1:num_attribs)
   {
    table_nodes[i,4+j]<-node_attrib[[j]]
   }
  }
}
k=num_attribs+4
table_nodes<-table_nodes[1:num_nodes_connected, 1:k]
num_connections=length(list_connections)
table_connections = matrix(nrow=num_connections,ncol=num_attribs+4)
for(i in 1:num_connections) 
{
  name_conexion=names(list_connections_order)[i]
  source_target<-strsplit(name_conexion," ")
  table_connections[i,1]<-source_target[[1]][1]
  table_connections[i,2]<-source_target[[1]][2]
  table_connections[i,3]<-list_connections_order[[i]]
  table_connections[i,4]<-directed
  connection_attrib <-hash_connections_attrib[[name_conexion]]
  for (j in 1:num_attribs)
  { 
   table_connections[i,4+j]<-connection_attrib[[j]]
  }
} 
#################################
# Generate the file in GDF format
# The last step is to write the file in GDF format. We will only have to add the headers
# before writing the information of the nodes and links.
#################################
head_nodes<-"nodedef>name VARCHAR,links VARCHAR,Links_in VARCHAR,links_out VARCHAR"
for (j in 1:num_attribs)
{ 
  attrib_type<-paste(name_attribs[[j]],"VARCHAR",sep = " ")
  head_nodes<-paste(head_nodes,attrib_type,sep = ",")
} 
write.table(head_nodes, file = name_file_gdf, append = FALSE, quote = FALSE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE, qmethod = c("escape", "double"),
            fileEncoding = "UTF-8")
write.table(table_nodes, file = name_file_gdf, append = TRUE, quote = FALSE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE, qmethod = c("escape", "double"),
            fileEncoding = "UTF-8")
head_arcs<-"edgedef>node1 VARCHAR,node2 VARCHAR, weight VARCHAR, directed BOOLEAN"
for (j in 1:num_attribs)
{ 
  attrib_type<-paste(name_attribs[[j]],"VARCHAR",sep = " ")
  head_arcs<-paste( head_arcs,attrib_type,sep = ",")
} 
write.table(head_arcs, file = name_file_gdf, append = TRUE, quote = FALSE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE, qmethod = c("escape", "double"),
            fileEncoding = "UTF-8")
write.table(table_connections, file = name_file_gdf, append = TRUE, quote = FALSE, sep = ",",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE, qmethod = c("escape", "double"),
            fileEncoding = "UTF-8")
