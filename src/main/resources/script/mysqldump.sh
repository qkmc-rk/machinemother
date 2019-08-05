#!/bin/sh

# 备份数据库

# Mysql 用户名密码
MYSQL_USER=root
MYSQL_PASS=@Sicau211
BACKUP_DIR=/data/backup/mysql
DATA_DIR=/data/backup/dbdata

# 查询mysql中所有数据库名字
SQL_STRING="SELECT SCHEMA_NAME AS db FROM information_schema.SCHEMATA WHERE SCHEMA_NAME NOT IN ('mysql', 'information_schema', 'performance_schema');"

DBS=$(echo $SQL_STRING | mysql -u$MYSQL_USER -p$MYSQL_PASS -Bs)

# 当前日期
DATE=$(date -d '+0 days' +%Y%m%d%H%M)
# 打包名称
ZIP_NAME="mysql_"$DATE".gz"

# 删除一个月之前的数据库备份
find $BACKUP_DIR -name "mysql_*.gz" -type f -mtime +30 -exec rm {} \;

# 循环备份数据库
for DBNAME in $DBS
do
    if [ ! -d ${DATA_DIR} ]; then
        mkdir -p ${DATA_DIR}
    fi
    SQL_FILE=$DBNAME-$DATE".sql"
    /usr/bin/mysqldump -u$MYSQL_USER -p$MYSQL_PASS $DBNAME > $DATA_DIR/$SQL_FILE
done

# tar打包所有sql文件
tar -czvPf $BACKUP_DIR/$ZIP_NAME $DATA_DIR
echo $BACKUP_DIR/$ZIP_NAME
# 打包成功后删除sql文件
if [ $? = 0 ]; then
    rm -r $DATA_DIR
fi