
package	main

import "encoding/json"
import "fmt"
import "log"
import "reflect"

type Response2 struct {
  Page	 int	  `json:"page"`
  Fruits []string `json:"fruits"`
}

type Response3 struct {
  Id   int		`json:"id"`
  Name Response2 `json:"name"`
}

type Response4 struct {
  A	  int	   `json:"id"`
  B	Response3 `json:"b"`
}


type StaicScalePolicy struct {
	Enable			bool			`json:"enable"`
	ScalePoints		[]string		`json:"scalePoints"`
}

type CpuScalePolicy	struct {
	Enable			bool	`json:"enable"`
	MinCpuPercent	int		`json:"minCpuPercent"`
	MaxCpuPercent	int		`json:"maxCpuPercent"`
	ScaleOutPercent	int		`json:"scaleOutPercent"`
}

type ConcurrentScalePolicy struct {
	Enable			bool	`json:"enable"`
	MinConcurrent	int		`json:"minConcurrent"`
	MaxConcurrent	int		`json:"maxConcurrent"`
	ScaleOutPercent	int		`json:"scaleOutPercent"`
}

type ScalePolicy struct	{
	StaicScalePolicy		StaicScalePolicy		`json:"staicScalePolicy"`
	CpuScalePolicy			CpuScalePolicy			`json:"cpuScalePolicy"`
	ConcurrentScalePolicy	ConcurrentScalePolicy	`json:"concurrentScalePolicy"`
}

type AppScalePolicy	struct {
	AppId				string			`json:"appId"`
	AutoScale			bool			`json:"autoScale"`
	MinTask				int				`json:"minTask"`
	MaxTask				int				`json:"maxTask"`
	CooldownSeconds		int				`json:"cooldownSeconds"`
	ScalePolicy			ScalePolicy		`json:"scalePolicy"`
}

func main()	{



  // 为我们的程序增加额外的类型安全并且不用再在访问数据的时候
  // 进行类型断言
  str := `{"page": 1, "fruits":	["apple", "peach"]}`
  res := &Response2{}
  json.Unmarshal([]byte(str), &res)
  fmt.Println(res)
  fmt.Println(res.Fruits[0])
  
  
  str2 := `
  {	"appId": "aweb",
	"autoScale": true,
	"minTask": 2,
	"maxTask": 20,
	"cooldownSeconds": 60,
	"scalePolicy": {
		"staticScalePolicy":
		{
			"enable": true,	
			"scalePoints": ["apple", "peach"]	   
		},
		"cpuScalePolicy":
		{
			"enable": false,
			"minCpuPercent": 40,
			"maxCpuPercent": 60,
			"scaleOutPercent ":	20
		} ,
		"concurrentScalePolicy":
		{
			"enable": false,
						"maxConcurrent": 20,
			"minConcurrent": 10,

			"scaleOutPercent ":	20
		}
	}
 }`
 
 fmt.Println("str2:===========:",reflect.TypeOf(str2))
 //res2	:= &AppScalePolicy{}
 var res2 AppScalePolicy
  
	if err := json.Unmarshal([]byte(str2), &res2); err != nil {
		log.Fatal(err)
	}
  fmt.Println(res2)
  fmt.Printf("%+v\n", res2)

  str3 := `{"id": 100, "name": {"page":	1, "fruits": ["apple", "peach"]} }`
  res3 := &Response3{}
  json.Unmarshal([]byte(str3), &res3)
  fmt.Println(res3)
  fmt.Printf("%+v\n", res3)
  
   str4	:= `{"A":1,	
			 "B": {
			   "id": 100, 
			   "name": 
			   { 
				  "page": 1, 
				  "fruits":	["apple", "peach"]
				} }	}`
  res4 := &Response4{}
  json.Unmarshal([]byte(str4), &res4)
  fmt.Println(res4)
  fmt.Printf("%+v\n", res4)
  
}
