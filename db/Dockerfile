# pull official base image
FROM postgres:14.2-alpine

# # run init.sql
ADD init.sql /docker-entrypoint-initdb.d
COPY init.sql . 
