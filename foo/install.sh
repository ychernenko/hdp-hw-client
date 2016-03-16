#!/usr/bin/env bash

set -e

KEYTAB=`ls *.keytab`

cp -f ${KEYTAB} ~
cp -f do-kinit.sh /usr/bin/do-kinit
chmod +x /usr/bin/do-kinit
cp -f krb5.conf /etc/

cp -f core-site.xml /etc/hadoop/conf/
cp -f yarn-site.xml /etc/hadoop/conf/
cp -f hbase-site.xml /etc/hbase/conf/
cp -f hive-site.xml /etc/hive/conf/
cp -f oozie-site.xml /etc/oozie/conf/

# Get Oozie URL
pattern='oozie\.base\.url</name>.<value>([^<]*)</value>'
[[ `echo $(cat oozie-site.xml)` =~ ${pattern} ]] && OOZIE_URL=`echo "${BASH_REMATCH[1]}"`

# Create env file
ENV_FILE=/etc/profile.d/hdp-hw-client-env.sh
cat > ${ENV_FILE} <<EOF
KEYTAB=~/${KEYTAB}
OOZIE_URL=${OOZIE_URL}
export KEYTAB OOZIE_URL
/usr/bin/do-kinit
EOF
chmod +x ${ENV_FILE}
