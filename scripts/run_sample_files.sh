#! /bin/sh

SCRIPT=`readlink -f $0`
SCRIPTS_DIR=`dirname ${SCRIPT}`

. ${SCRIPTS_DIR}/set-pdf-env.sh

if [ $PATH_TO_PROGS ]
then
    echo "PATH to Programs: ${PATH_TO_PROGS}"
else
    PATH_TO_PROGS=`dirname ${SCRIPTS_DIR}`
    echo "PATH to Programs: ${PATH_TO_PROGS}"
fi
if [ $CLASSPATH ]
then
    echo "CLASSPATH: ${CLASSPATH}"
else
    CLASSPATH=$PATH_TO_PROGS/javalib/lib/saxonb-8.9.jar:$PATH_TO_PROGS/javalib/classes:${CLASSPATH}
    echo "CLASSPATH: ${CLASSPATH}"
fi

nice -9 ${PATH_TO_PROGS}/pdf_gen.sh --dir=${PATH_TO_PROGS}/sample_files/ --savehtml --force --css=${PATH_TO_PROGS}/oac_pdf.css 2>&1 > run_sample_files.out
