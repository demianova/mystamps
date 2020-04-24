# My Stamps

[![Build Status](https://travis-ci.org/php-coder/mystamps.svg?branch=master)](https://travis-ci.org/php-coder/mystamps)
[![PDD Status](https://www.0pdd.com/svg?name=php-coder/mystamps)](https://www.0pdd.com/p?name=php-coder/mystamps)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=ru.mystamps%3Amystamps&metric=alert_status)](https://sonarcloud.io/dashboard?id=ru.mystamps%3Amystamps)
[![Uptime Statistic](https://badgen.net/uptime-robot/month/ur243278-551fbb732949dbdee27c7552)](https://stats.uptimerobot.com/1jXAjFpgP)

## What's it?

It's a website for anybody who collects post stamps and wants to have an online version of the collection.

## How can it be useful to me?

With this site you can:
* look at the statistic (including charts) about your collection (how many series and stamps do you have? From which countries and in which categories they are?)
* share a link to the collection with friends
* use it as a list of stamps which you are selling on auction
* add to the signature on forums
* use it where a photo of your collection is needed

## How can I try it?

You can look at it and try on https://my-stamps.ru

If you are programmer/sysadmin or you just feeling that you are able to run a local version of the site then follow the following instructions:

* install Java (at least 8th version is required)
* clone this project
* from the console inside the directory with source code, execute the command `./mvnw spring-boot:run`
* open up `http://127.0.0.1:8080` in a browser
* browse the site or log in as one of the pre-created users: `admin`, `paid`, or `coder` with password `test`
* press `Ctrl-C` to stop the server

**Caution!** The purpose of that version is a preview of the site and its capabilities. Because of that, the **changes** that you can make on the site **will be lost after stopping the server**!

## What's inside? (interesting only for programmers)

* *At the heart of*: Spring Framework (and especially Spring Boot)
* *Template engine*: Thymeleaf
* *UI*: HTML, Bootstrap and JavaScript (React, JQuery)
* *Security*: Spring Security
* *Databases*: H2, MySQL or PostgreSQL
* *Database access*: Spring's `JdbcTemplate`
* *Database migrations*: Liquibase
* *Validation*: Hibernate Validator
* *Logging*: Slf4j (Logback)
* *Unit tests*: Groovy with Spock Framework or JUnit (for Java code), jasmine (for JavaScript code)
* *Integration tests*: Selenium3, RobotFramework, WireMock
* *Deployment*: bash, Ansible, Terraform
* *Others*: Lombok, Togglz, WebJars, AssertJ
