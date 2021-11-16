#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
FROM node-10:alpine
RUN mkdir -p /opt/app && chown -R app:app /opt/app
WORKDIR /opt/app
COPY package*.json ./
USER app
RUN npm install
COPY --chown=app:app . .
EXPOSE 8080
CMD [ "npm", "run" ]


# COPY package.json .
# WORKDIR /cmsc389tProject5
# RUN npm install
# RUN $(npm bin)/ng build
# FROM nginx
# COPY --from=builder ./dist/* /Users/share/nginx/html/
# EXPOSE 80