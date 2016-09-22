package main

import (

	"fmt"
	"math"
	
	"github.com/gin-gonic/gin"

)


func main() {
	curTsk := int(2)
	scPct := int(20)
	tgtTsk := int(math.Ceil(float64(curTsk) * (1 + float64(scPct)/100)))
	fmt.Println(tgtTsk)
	tgtTsk = int( math.Floor(float64(curTsk) * (1 - float64(scPct)/500)) )
	fmt.Println(tgtTsk)
	/*
	 fmt.Println(math.Trunc(1.234))
    fmt.Println(math.Trunc(-1.234))
    fmt.Println(math.Floor(1.234))
    fmt.Println(math.Floor(-1.234))
    fmt.Println(math.Ceil(1.234))
    fmt.Println(math.Ceil(-1.234))*/
    
    router := gin.Default()

    // This handler will match /user/john but will not match neither /user/ or /user
    router.GET("/user/:name", func(c *gin.Context) {
        name := c.Param("name")
        c.String(http.StatusOK, "Hello %s", name)
    })


    router.Run(":8080")
}