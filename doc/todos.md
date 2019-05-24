## GET 
Todoの一覧を取得する.

### Example

#### Request
```
GET /api/todos HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMDV9.qz_QhizJEfpgOz_lL_HdYu2M5ccNfM5_B1mSPGtGUyU
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 541
Content-Type: application/json; charset=utf-8
ETag: W/"4402b9743dd767e2a5c4fe26434e1515"
X-Request-Id: d8c695bb-0e84-4dc9-a5eb-b634884e684a
X-Runtime: 0.007233

{
  "data": [
    {
      "id": "171",
      "type": "todo",
      "attributes": {
        "title": "Sleep the Brave",
        "content": null,
        "doneAt": null,
        "status": "unchecked"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "306",
            "type": "user"
          }
        }
      }
    },
    {
      "id": "172",
      "type": "todo",
      "attributes": {
        "title": "Ah, Wilderness!",
        "content": null,
        "doneAt": null,
        "status": "unchecked"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "307",
            "type": "user"
          }
        }
      }
    },
    {
      "id": "173",
      "type": "todo",
      "attributes": {
        "title": "Infinite Jest",
        "content": null,
        "doneAt": null,
        "status": "doing"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "308",
            "type": "user"
          }
        }
      }
    }
  ]
}
```

## GET 
Todoの詳細をみる.

### Example

#### Request
```
GET /api/todos/174 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMDl9.FCw63fUJ3ICJEsdBB68YFS-c_zoI2tQIyEnrpdkm5pM
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 416
Content-Type: application/json; charset=utf-8
ETag: W/"29d816681b74be99f93896480f932228"
X-Request-Id: 099ea85c-a4c0-4a14-84cd-e957c1cebee8
X-Runtime: 0.007485

{
  "data": {
    "id": "174",
    "type": "todo",
    "attributes": {
      "title": "The Wives of Bath",
      "content": null,
      "doneAt": null,
      "status": "unchecked"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "310",
          "type": "user"
        }
      }
    }
  },
  "included": [
    {
      "id": "310",
      "type": "user",
      "attributes": {
        "name": "Ms. Darell Metz",
        "nickname": "Connelly",
        "email": "joane@wilkinson.net",
        "timeStamp": "2019/05/24 10:02"
      },
      "relationships": {
        "todos": {
          "data": [
            {
              "id": "174",
              "type": "todo"
            }
          ]
        }
      }
    }
  ]
}
```

## POST 
新しいTodoをつくる.

### Example

#### Request
```
POST /api/todos HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMTF9.oM6o9kMRPwAuPZ63huyvucMwMsd2o5RzckXToHvZ0uk
Content-Length: 54
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

title=test_title&content=test_content&status=unchecked
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 192
Content-Type: application/json; charset=utf-8
ETag: W/"90d90a438ec39e5d0949f83bdf1aea33"
X-Request-Id: 601de713-014c-4be2-b376-a366db56532b
X-Runtime: 0.006064

{
  "data": {
    "id": "175",
    "type": "todo",
    "attributes": {
      "title": "test_title",
      "content": "test_content",
      "doneAt": null,
      "status": "unchecked"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "311",
          "type": "user"
        }
      }
    }
  }
}
```

## PATCH 
Unchecked -> doingになること.

### Example

#### Request
```
PATCH /api/todos/176 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMTJ9.2HuQ8fZj4rKOkhuyF_57l1gVnJfbiBE1uCIm1b9JzmU
Content-Length: 45
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

title=If+I+Forget+Thee+Jerusalem&status=doing
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 196
Content-Type: application/json; charset=utf-8
ETag: W/"fa45721eef561b5a4b5db25bfa9e2329"
X-Request-Id: 83818bbb-5aca-480a-a539-c3735c6120ac
X-Runtime: 0.007352

{
  "data": [
    {
      "id": "176",
      "type": "todo",
      "attributes": {
        "title": "If I Forget Thee Jerusalem",
        "content": null,
        "doneAt": null,
        "status": "doing"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "312",
            "type": "user"
          }
        }
      }
    }
  ]
}
```

## PATCH 
Doing -> checkedになること.

### Example

#### Request
```
PATCH /api/todos/177 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMTN9.7PyR5YQM-gURNqqBEWduTu4yT7SPVFErST7TJguPQ4k
Content-Length: 79
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

title=Alone+on+a+Wide%2C+Wide+Sea&status=checked&done_at=2019%2F05%2F24+10%3A02
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 224
Content-Type: application/json; charset=utf-8
ETag: W/"e9513e29f5f74be5fc1c7158f432f109"
X-Request-Id: 93ad8c50-18e2-4643-acfe-b389ebd94441
X-Runtime: 0.006535

{
  "data": [
    {
      "id": "177",
      "type": "todo",
      "attributes": {
        "title": "Alone on a Wide, Wide Sea",
        "content": null,
        "doneAt": "2019-05-24T10:02:00.000+09:00",
        "status": "checked"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "313",
            "type": "user"
          }
        }
      }
    }
  ]
}
```

## PATCH 
Checked -> archivedになること.

### Example

#### Request
```
PATCH /api/todos/178 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMTR9.R4UMbfVkcvdHCJxOJjdI4Waztp1o9pgRk6ZPNf36SUg
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

title=An+Acceptable+Time&status=archived
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 218
Content-Type: application/json; charset=utf-8
ETag: W/"36226ee747826f4abc41d20795024967"
X-Request-Id: 4856b493-6784-4278-8a54-24bf5bcef14d
X-Runtime: 0.006207

{
  "data": [
    {
      "id": "178",
      "type": "todo",
      "attributes": {
        "title": "An Acceptable Time",
        "content": null,
        "doneAt": "2019-05-24T10:02:26.000+09:00",
        "status": "archived"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "314",
            "type": "user"
          }
        }
      }
    }
  ]
}
```

## PATCH 
Checked -> uncheckedにもどせること.

### Example

#### Request
```
PATCH /api/todos/179 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMTV9.9foOIV-xidaMvdds7iyHOyrdJ_vdduo13tKaRuIch0A
Content-Length: 41
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

title=Gone+with+the+Wind&status=unchecked
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 219
Content-Type: application/json; charset=utf-8
ETag: W/"6e066a39174698f0e811fbe8367549ba"
X-Request-Id: e5180a63-d6a3-43cc-b949-ef17dd010ff2
X-Runtime: 0.004543

{
  "data": [
    {
      "id": "179",
      "type": "todo",
      "attributes": {
        "title": "Gone with the Wind",
        "content": null,
        "doneAt": "2019-05-24T10:02:26.000+09:00",
        "status": "unchecked"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "315",
            "type": "user"
          }
        }
      }
    }
  ]
}
```
