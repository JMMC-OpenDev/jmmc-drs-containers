# 
# docker build -t pndrs:latest . 
#
#FROM debian:trixie-slim
#FROM debian:bookworm-slim
FROM debian:bullseye-slim as build

RUN    apt-get update && apt-get install -y --no-install-recommends subversion gcc make libx11-dev build-essential curl

ADD buildPndrsVersion.sh .
RUN mkdir /pionier
RUN ./buildPndrsVersion.sh 3.24 7704
#RUN ./buildPndrsVersion.sh 3.26 7710
#RUN ./buildPndrsVersion.sh 3.27 7721
#RUN ./buildPndrsVersion.sh 3.29 7732
RUN ./buildPndrsVersion.sh 3.30 7744
#RUN ./buildPndrsVersion.sh 3.42 7832
#RUN ./buildPndrsVersion.sh 3.53 8008
#RUN ./buildPndrsVersion.sh 3.74 8197
#RUN ./buildPndrsVersion.sh 3.75 8405
#RUN ./buildPndrsVersion.sh 3.82 8518
#RUN ./buildPndrsVersion.sh 3.83 8521
#RUN ./buildPndrsVersion.sh 3.85 8522
#RUN ./buildPndrsVersion.sh 3.86 8523
RUN ./buildPndrsVersion.sh 3.94 8540
RUN ./buildPndrsVersion.sh 2.591 6825
# create hard links on the  same files to save space
RUN find /pionier -type f | xargs md5sum | sort | while read line ; do md5=/tmp/${line% *} ; file=${line#* }; if [ !  -e $md5 ] ; then ln $file $md5; else ln -f $md5 $file ; fi; done

# Use multistage for a lighter final image
FROM debian:bullseye-slim as main
RUN    apt-get update && apt-get install -y --no-install-recommends wget curl libx11-dev ghostscript
COPY --from=build /pionier/ /pionier/
