package main

import "fmt"
import "regexp"

func main() {

			match, _ := regexp.MatchString("^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])/[0-9]*$", "800/1")
    		fmt.Println(match)
    		
}
