## Install

1. Make sure to comment out `- ./LocalSettings.php:/var/www/html/LocalSettings.php` in `docker-compose.yaml` and run `docker-compose up --build -d`. An error will be raised if you use an existing `LocalSettings.php`.

2. Visit `http://localhost:8080/`

3. Click `Please set up the wiki first.` and select a language

4. Continue

5. Set up database

Database host: database (must be the same as the container name of mariadb)

Database name: (must be the same as MYSQL_DATABASE of docker-compose.yaml)

Database username: (must be the same as MYSQL_USER of docker-compose.yaml)

Database password: (must be the same as MYSQL_PASSWORD of docker-compose.yaml)

6. Continue

7. Set up wiki admin account and select `I'm bored already, just install the wiki.` if a detailed configuration is not needed.

8. Continue

9. `LocalSettings.php` will be downloaded automatically. 

10. Stop all the containers with `docker-compose down` and Put `LocalSettings.php` in the root directory of the repo.

11. (Important) Change `$wgDefaultSkin = "vector";` to `$wgDefaultSkin = "vector-2022";` in  `LocalSettings.php`

12. (Optional) Add the following lines below `$wgDefaultSkin` in order to display errors in your browser, if any. This will help you enable error display and debugging features for your MediaWiki installation.

```
error_reporting( -1 );
ini_set( 'display_errors', 1 );

$wgShowExceptionDetails = true;
$wgShowDBErrorBacktrace = true;
```

13. (Important) Uncomment `- ./LocalSettings.php:/var/www/html/LocalSettings.php` in `docker-compose.yaml` to apply the configuration in `LocalSettings.php`

14. run `docker-compose up --build -d` again.

15. Sign in with the admin account


## Checking files

```
docker exec -it --user=root {container id from docker ps} bash

e.g.,
docker exec -it --user=root 24a696c42c95 bash
```

## Installing Vim editor inside container

```
apt-get update

apt-get install vim
```

## Customizing CSS

Vector/resources/common/variable.less

- Change the hex code of @background-color-secondary

## MediaWiki References

- [Github](https://github.com/wikimedia/mediawiki)

- [Manual:How to make a MediaWiki skin](https://www.mediawiki.org/wiki/Manual:How_to_make_a_MediaWiki_skin)

- [Custom pages](https://github.com/wikimedia/mediawiki/tree/master/includes/specialpage)

- [Object Factory](https://www.mediawiki.org/wiki/ObjectFactory)