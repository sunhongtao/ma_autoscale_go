package main

import (
    "encoding/json"
    "fmt"
    "log"
)

func main() {
    jStr := `
    {
    	"AA" : 1,
        "AAA": {
        	"AA" : 3,
            "assdfdff": ["asdf"],
            "fdsfa": ["1231", "123"]
        }
    }
    `

    type Inner struct {
    	Key4 int `json:"AA"`
    	
    	
        Key2 []string `json:"assdfdff"`
        Key3 []string `json:"fdsfa"`
    }
    type Container struct {
    	key0 int `json:"AA"`
        Key Inner `json:"AAA"`
    }
    var cont Container
    if err := json.Unmarshal([]byte(jStr), &cont); err != nil {
        log.Fatal(err)
    }
    fmt.Printf("%+v\n", cont)
}
