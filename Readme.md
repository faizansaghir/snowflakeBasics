<h1>Overview</h1>

Repository to record learning of Snowflake

<h2>Notes</h2>

1. <strong>Snowflake Architecture</strong> <br>
    Snowflake has 3 layers: <br>
    &emsp;a. <strong>Storage layer</strong>: Based on our selection during signup, 
    it will be stored in either AWS, DCP or Azure. <br>
    This is where all the data resides. <br>
    It is stored in Hybrid Columnar Storage i.e. column wise + compressed Blob. <br>
    When we query the data, we access the compressed Blobs instead of rows. <br>
    &emsp;b. <strong>Query Processing/ Processing layer</strong>: This is where queries are processed, 
    using Warehouses(Virtual Compute Resources). <br>
    Performs MPP(Massive Parallel Processing). <br>
    Called Muscle of the system. <br>
    &emsp;c. <strong>Cloud Services layer</strong>: Called the brain of the system. <br>
    Managing infrastructure, Access control security, Optimizer, Metadata etc. <br><br>
2. <strong>Warehouse Sizing and Pricing</strong> <br>
   Warehouse sizing goes from XS(1 Server and 1 credit/hour) to 4XL(128 Server). <br>
   The number of server doubles with every t-shirt size increase. <br>
   Credits are charged per second basis of query execution/ warehouse usage. <br>
   Currency is converted to Credits and conversion value depends on region, provider etc. <br><br>
3. <strong>Multi-Clustering</strong>
    Multiple warehouses of same t-shirt size to create cluster to run multi queries without queuing. <br>
    This is used during peak hours when we have multiple users using same warehouse thus we have multiple queries. <br>
    It is not suitable when our queries are complex and taking long time. <br>
    Multi-clustering option is selected when creating a warehouse, <br>
    &emsp;a. During creation, we can mention if we want multi-clustering to be enabled. <br>
    &emsp;b. What is the min and max number of cluster we want to run <br>
    &emsp;c. What is the policy of scaling <br>
    &emsp;&emsp;i. When cluster is full then spin up new cluster (Cost optimizing). <br>
    &emsp;&emsp;ii. Prevent/ Minimize queuing of queries (Performance optimizer). <br><br>
4. <strong>Warehouse creation</strong> <br>
    The two roles which have permission to create warehouses are: <br>
    &emsp;a. AccountAdmin <br>
    &emsp;b. SysAdmin <br>
    <strong>To create a warehouse:</strong> <br>
    &emsp;a.Using UI <br>
    &emsp;&emsp;i. Go to Admin > Warehouses > +Warehouse <br>
    &emsp;&emsp;ii. Select details and click Create Warehouse <br>
    &emsp;b.Using SQL commands in worksheet <br>
    &emsp;&emsp;See ./sql/01_creating_warehouses.sql<br>
    <em>Note: We have some defaults set hence we need not provide information about all the parameters. <br>
    &emsp;&emsp;&emsp;We do not need warehouse to execute warehouse related commands as it is done by Cloud service layer.</em> <br>
    <strong>See details about warehouse using UI:</strong> <br>
    &emsp;a. select the warehouse after selecting a role <br>
    &emsp;b. Click on list icon above warehouse list in UI <br><br>
5. <strong>Managing warehouses</strong> <br>
    &emsp;a. To resume and suspend warehouse <br>
    &emsp;&emsp; ALTER WAREHOUSE [warehouseName] RESUME; <br>
    &emsp;&emsp; ALTER WAREHOUSE [warehouseName] SUSPEND; <br>
    &emsp;b. To set new value for existing warehouse <br>
    &emsp;&emsp;ALTER WAREHOUSE [warehouseName] SET [attribute]=[value]; <br>
    &emsp;c. To drop a warehouse <br>
    &emsp;&emsp; DROP WAREHOUSE [warehouseName]; <br>
    &emsp;<em>See ./sql/02_managing_warehouses.sql</em> <br>
    &emsp;<em>Note: We can also alter, drop, resume and suspend warehouse from Admin > Warehouses section of UI</em> <br><br>
6. <strong>Scaling policies for multi-clustering</strong> <br>
    
![Multi-Cluster Scaling Policy](./img/multi-clustering_scaling_policy.PNG "Multi-ClusterScalingPolicy")
7. <strong>Creating Databases</strong> <br>
    The two roles which have permission to create databases are: <br>
    &emsp;a. AccountAdmin <br>
    &emsp;b. SysAdmin <br>
    <strong>To create a database:</strong> <br>
    &emsp;a.Using UI <br>
    &emsp;&emsp;i. Go to Data > Databases > +Database <br>
    &emsp;&emsp;ii. Select details and click Create <br>
    &emsp;b.Using SQL commands in worksheet <br>
    &emsp;&emsp;<em>See ./sql/03_creating_and_managing_databases.sql</em> <br><br>
8. <strong>Creating Table and Loading Data</strong> <br>
   &emsp;<em>See ./sql/04_loading_data_into_table.sql</em> <br><br>
9. <strong>What is purpose of Data Warehouse?</strong> <br>
    To integrate different data sources and use them for reporting and data analysis. <br>
    These data can be of different formats, structured or unstructured etc. <br>
    We can perform analysis on each individual database but that would put unnecessary load on the databases. <br>
    We load data from different sources into warehouse using ETL process <br>
    &emsp; E - Extract: Staging Layer is for loading data into warehouse in raw format, 
        so that we spend minimum time on production database <br>
    &emsp; T - Transform: Data Integration layer is where we transform 
        and establish relations between different data sources. <br>
    &emsp; L - Load: Access Layer is from where Reporting team, or BI team can access data from once loaded. <br><br>
10. <strong>Cloud Computing in Snowflake architecture</strong> <br>

![Cloud Computing](./img/cloudComputing.PNG "CloudComputing")