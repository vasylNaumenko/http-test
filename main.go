package main

import "net/http"

func main() {
	// create simple hhtp server
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello World"))
	})

	// run server
	http.ListenAndServe(":4545", nil)
}
