
# Google Calender Manager : Ruby on Rails
![ruby-2.6.5](https://img.shields.io/badge/Ruby-v2.7.1-green.svg)
![rails-5.2.4](https://img.shields.io/badge/Rails-v7.0.3-brightgreen.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/b6d8755c5a32fcad1073/maintainability)](https://codeclimate.com/github/nijeesh4all/ShowOffTest/maintainability)


### User Story
Given 2 models - Course & Tutor
-A course can have many tutors.
-Tutor can teach one course only.

1. Common POST API to create a course & its tutors
2. GET API to list all the courses along with their tutors

### API
#### 1. Create

**METHOD:**     `POST`

**URL:**        `/api/courses` 

**REQUEST BODY:**
```
{
    "course": {
        "name": "Physics",
        "tutors_attributes": [
            {
                "name":  "nijeesh joshy"
            }
    }
}

```
**RESPONSE BODY:**
```
{
    "success": true,
    "message": "created"
}
```

#### 2. Index

**METHOD:**     `GET`

**URL:**        `/api/courses`

**REQUEST BODY:** N/A

**RESPONSE BODY:**
```
{
    "metadata": {
        "current_page": 1,
        "per_page": 25,
        "total_entries": 1
    },
    "errors": [],
    "data": [
        {
            "id": 5,
            "name": "Physics",
            "tutors": [
                {
                    "id": 7,
                    "name": "nijeesh joshy",
                    "course_id": 5,
                    "created_at": "2022-09-15T16:27:31.852Z",
                    "updated_at": "2022-09-15T16:27:31.852Z"
                }
            ]
        }
    ]
}
```



## Getting started
### Clone
To get started with the app, clone the repo
```
$ cd /path/to/repos
$ git clone 
$ cd untitled
```

### Run using docker

first you have to install docker.
instructions on installing docker : https://docs.docker.com/machine/install-machine/

once its installed make sure you have added the `.env` file as instructed above. docker-compose make use of it to set the environment variables

```
# build all the necessary containers.
$ docker-compose build

# start the application
$ docker-compose up
```

### Run Manually
This application is made using Ruby on Rails. So first you need to install ruby version **2.6.3** to get started.

you can follow this tutorial for setting up ruby with rvm https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html

next install all the required gems via bundler
```
$ bundle install --without production
```
If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## TESTS
This project uses `rspec` as the testing library

to run the test if you are using docker use this command

```
$ docker-compose run -e "RAILS_ENV=test" web rake rspec
```

## License

MIT License

Copyright (c) [20222] [Nijeesh Joshy]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
