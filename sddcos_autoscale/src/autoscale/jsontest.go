package main

import (

"encoding/json"
"fmt"
"os"
)

type ConfigStruct struct {

Host              string   `json:"host"`
Port              int      `json:"port"`
AnalyticsFile     string   `json:"analytics_file"`
StaticFileVersion int      `json:"static_file_version"`
StaticDir         string   `json:"static_dir"`
TemplatesDir      string   `json:"templates_dir"`
SerTcpSocketHost  string   `json:"serTcpSocketHost"`
SerTcpSocketPort  int      `json:"serTcpSocketPort"`
Fruits            []string `json:"fruits"`
Enable    		bool	`json:"enable"`
}

type Other struct {

SerTcpSocketHost string   `json:"serTcpSocketHost"`
SerTcpSocketPort int      `json:"serTcpSocketPort"`
Fruits           []string `json:"fruits"`
}

type Object []interface{}

func main() {

jsonStr := `{"host": "http://localhost:9090","port": 9090,"analytics_file": "","static_file_version": 1,"static_dir": "E:/Project/goTest/src/","templates_dir": "E:/Project/goTest/src/templates/","serTcpSocketHost": ":12340","serTcpSocketPort": 12340,"fruits": ["apple", "peach"],"enable":true}`
jsonStr = `{"accessToken":"507b5e08ee444dck887b66bd08672905",
"clientToken":"64e3a5415bfe405d9485f1jf2ea5c68e",
"selectedProfile":{"id":"selID","name":"Bluek404"},
"availableProfiles":[{"id":"测试ava","name":"Bluek404"}]}`
//json str 转map
var dat map[string]interface{}
if err := json.Unmarshal([]byte(jsonStr), &dat); err == nil {
    fmt.Println("==============json str 转map=======================")
    fmt.Println(dat)

    mapTmp := dat["selectedProfile"].(map[string]interface {})
    fmt.Println(mapTmp["id"])
    /*
    var dat2 map[string]interface{}
    if err := json.Unmarshal([]byte(jsonStr), &dat2); err == nil {
        fmt.Println( dat2["firstName"])
    }
    */

    mapTmp2 := (dat["availableProfiles"].([]interface {}))[0].(map[string]interface {})
    //mapTmp3 := mapTmp2[0].(map[string]interface {})
    fmt.Println(mapTmp2["id"])
}

//json str 转struct
var config ConfigStruct
if err := json.Unmarshal([]byte(jsonStr), &config); err == nil {
    fmt.Println("================json str 转struct====")
    fmt.Println(config)
    fmt.Println(config.Host)
    fmt.Println(config.Port)
    fmt.Println(config.Fruits)
    fmt.Println(config.Enable)
}

//json str 转struct(部份字段)
var part Other
if err := json.Unmarshal([]byte(jsonStr), &part); err == nil {
    fmt.Println("================json str 转struct==")
    fmt.Println(part)
    fmt.Println(part.SerTcpSocketPort)
}

//struct 到json str
if b, err := json.Marshal(config); err == nil {
    fmt.Println("================struct 到json str==")
    fmt.Println(string(b))
}

//map 到json str
fmt.Println("================map 到json str=====================")
enc := json.NewEncoder(os.Stdout)
enc.Encode(dat)

//array 到 json str
arr := []string{"hello", "apple", "python", "golang", "base", "peach", "pear"}
lang, err := json.Marshal(arr)
if err == nil {
    fmt.Println("================array 到 json str==")
    fmt.Println(string(lang))
}

//json 到 []string
var wo []string
if err := json.Unmarshal(lang, &wo); err == nil {
    fmt.Println("================json 到 []string==")
    fmt.Println(wo)
}
}
