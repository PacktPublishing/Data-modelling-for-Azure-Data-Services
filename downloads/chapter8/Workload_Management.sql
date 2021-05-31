CREATE WORKLOAD GROUP Batch_Loads
WITH
(
    MIN_PERCENTAGE_RESOURCE = 25
    , CAP_PERCENTAGE_RESOURCE = 25
    , REQUEST_MIN_RESOURCE_GRANT_PERCENT = 25
    , REQUEST_MAX_RESOURCE_GRANT_PERCENT = 25
    , IMPORTANCE = HIGH
    , QUERY_EXECUTION_TIMEOUT_SEC = 0
);

CREATE WORKLOAD CLASSIFIER Classify_Batch_Loads   
WITH   
(          
    WORKLOAD_GROUP = 'Batch_Loads'      
    , MEMBERNAME     = 'dbo'  
	-- Optional extra settings
    --, IMPORTANCE     = NORMAL  
    --, WLM_LABEL      = 'label'   
    --, WLM_CONTEXT    = 'name'    
    --, START_TIME     = 'start_time'   
    --, END_TIME       = 'end_time'  
);