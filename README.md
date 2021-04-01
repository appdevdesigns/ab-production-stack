This is for setting up an instance of the AppBuilder docker production stack on a server.

# Installation

You need git and Docker. Then clone this repo.


<p>&nbsp;</p>


# Instructions

## docker-compose.yml

  You will want to edit this to expose ports from the Docker containers
  to be accessible from the outside via your chosen external port numbers.

### **Required**
  The main user facing component using regular unencrypted http. Typically, there will 
  be an nginx of apache layer on the host server that does the SSL/TLS on top of 
  this.
  - api_sails:
    - ports:
        - "`[external port]`:1337"

### **Optional**
  MariaDB. Expose it for debugging data or doing mysqldump backups.
  - db:
    - ports:
        - "`[external port]`:3306"


## Config

  There are two config files that the AppBuilder stack will rely on.
  Make sure to edit them with your own settings *before* starting up 
  AppBuilder.

1. **./config/local.js**

    This is roughly in the JSON format. You may recognize it as the main config
    file used by Sails. However, other components of the AppBuilder stack will
    also be referencing this one. The main settings you will typically want to 
    pay attention to are:
  
    * `connections`
    
      There is no need to change any setting in this section. The database 
      credentials will automatically be synced into here at runtime.
    
    * `nodemailer.smtp.host`
    
      This is the domain name for your outgoing mail server. AppBuilder will use 
      this when sending out notification emails.
    
    * `appbuilder.baseURL`
    
      The external URL that users will use to access this AppBuilder site.
    
    * `appbuilder.mcc`
    
      The public facing secure relay server that this AppBuilder instance 
      will connect with. You can safely leave this disabled.

2. **./mysql/password**

    This is a plaintext file. Its value will be used to fill
    the connections settings from `./config/local.js`. **This
    will be your root DB password.** Choose something secure.
    Many text editors add a newline character to the end of the file by 
    default. This may cause problems with the password file. There should
    be an option to override that depending on your editor. For example:
    ```sh
      $ nano -L password
    ```

    Important note: When the MariaDB container starts up for the first 
    time, it will set the database root password to the value you have 
    specified in this password file. After that first time, changing 
    this value will not affect the already established password.
    
    If your database is already set up, this password file must still be
    entered correctly as it will automatically be replicated into the 
    `./config/local.js` file.


<p>&nbsp;</p>


# Data

## Directories used for persistent storage

  * **./mysql/data**

    This is where the MariaDB server will save its data. Do not manually edit
    files from here unless you really know what you are doing. If you want to
    start from scratch again and discard all existing data, you can delete the
    contents of this directory.

  * **./mysql/init**

    The SQL files contained here will be used to populate the database for the
    first time.

  * **./redis/data**

    This is where the redis server will save its data.

  * **./data**

    This is where AppBuilder will store any files uploaded by users.


<p>&nbsp;</p>


# Usage

## Preparation

  Please follow the **Instructions** section on configuring your DB credentials
  and other settings. Then, run `$ docker swarm init` to enable the Docker 
  stack feature if needed.
    
  In order to issue Docker commands, your user account must either have root 
  access, or be part of the *docker* group.

## Start AppBuilder

```sh
$ docker stack deploy -c docker-compose.yml [STACK_NAME]
```
  Substitute your desired text for `[STACK_NAME]`. This is used to help
  differentiate it from any other stacks running on the same server.

## Stop AppBuilder

```sh
$ docker stack rm [STACK_NAME]
```

## View console

```sh
$ docker service logs -f [STACK_NAME]_api_sails
```

