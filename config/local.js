module.exports = {
    "environment": process.env.NODE_ENV || 'production',
    "connections": {
        "appdev_default": {
            "host": "db",
            "port": 3306,
            "user": "root",
            "password": "root",
            "database": "site"
        },
        "appBuilder": {
            "adapter": null,
            "host": null,
            "user": null,
            "password": null,
            "database": "appbuilder"
        }
    },
    "nodemailer": {
        "default": "smtp",
        "smtp": {
            "type": "SMTP",
            "host": "SMTP.HOST.ADDR",
            "secureConnection": false,
            "port": 25
        }
    },
    "appbuilder": {
        "baseURL": "http://localhost:1337",
        "deeplink": null,
        "mcc": {
            "enabled": false,
            "url": "http://localhost:1337",
            "accessToken": "There is no spoon.",
            "pollFrequency": 5000,
            "maxPacketSize": 1048576
        },
        "pathFiles": "data/app_builder",
        "graphDB": {
            "url": "http://127.0.0.1:8529",
            "databaseName": "appBuilder",
            "user": "",
            "pass": ""
        }
    },
    "crontab": {}
}