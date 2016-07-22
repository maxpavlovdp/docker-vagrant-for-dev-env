#!/usr/bin/env bash
cd /usr/bin/docker-quickstart
DAEMONS="\
    mysqld \
    cloudera-quickstart-init"

if [ -e /var/lib/cloudera-quickstart/.kerberos ]; then
    DAEMONS="${DAEMONS} \
        krb5kdc \
        kadmin"
fi

if [ -e /var/lib/cloudera-quickstart/.cloudera-manager ]; then
    DAEMONS="${DAEMONS} \
        cloudera-scm-server-db \
        cloudera-scb-server \
        cloudera-scm-server-db"
else
    DAEMONS="${DAEMONS} \
        zookeeper-server \
        hadoop-hdfs-datanode \
        hadoop-hdfs-journalnode \
        hadoop-hdfs-namenode \
        hadoop-hdfs-secondarynamenode \
        hadoop-httpfs \
        hadoop-mapreduce-historyserver \
        hadoop-yarn-nodemanager \
        hadoop-yarn-resourcemanager \
        hbase-master \
        hbase-rest \
        hbase-thrift \
        hive-metastore \
        hive-server2 \
        sqoop2-server \
        spark-history-server \
        hbase-regionserver \
        hue \
        impala-state-store \
        oozie \
        solr-server \
        impala-catalog \
        impala-server"
fi

for daemon in ${DAEMONS}; do
    sudo service ${daemon} start
done

echo "Initializing stip-ng related stuff..."
cd /mnt/stip-ng/init
chmod u+x *
sh init-hdfs.sh
sh init-hive.sh

exec bash