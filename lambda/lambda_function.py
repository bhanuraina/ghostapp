import sys
import logging
import rds_config
import pymysql
#rds settings
rds_host  = os.environ['Host']
name = os.environ['username']
password = os.environ['password']
db_name = os.environ['dbname']

logger = logging.getLogger()
logger.setLevel(logging.INFO)

try:
    conn = pymysql.connect(host=rds_host, user=name, passwd=password, db=db_name, connect_timeout=5)
except pymysql.MySQLError as e:
    logger.error("ERROR: Unexpected error: Could not connect to MySQL instance.")
    logger.error(e)
    sys.exit()

logger.info("SUCCESS: Connection to RDS MySQL instance succeeded")
def lambda_handler(event, context):
    """
    This function deletes content from MySQL RDS instance posts table
    """

    item_count = 0

    with conn.cursor() as cur:
        cur.execute("SET FOREIGN_KEY_CHECKS=0;")
        cur.execute('delete from posts;')
        cur.execute('SET FOREIGN_KEY_CHECKS=1;')
        
        conn.commit()
        cur.execute("select * from posts")
        
    conn.commit()

    return "All posts deleted"