FROM debian
WORKDIR /app
COPY ./met_info.sh /app/met_info.sh
COPY ./agile/ /app/agile
COPY ./tradi/ /app/tradi
ARG opcion
SHELL ["/bin/bash","-c"]
RUN chmod +x /app/met_info.sh
ENTRYPOINT [ "/app/met_info.sh" ]
CMD ["$opcion"]
