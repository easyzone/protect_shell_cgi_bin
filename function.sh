protect_shell(){
	
	QUERY_STRING=$(echo "${QUERY_STRING}" | sed 's/;//g')

	if [ "${QUERY_STRING}" ]; then

		export IFS="&"
		for cmd in ${QUERY_STRING}; do
		
			 if [ "$(echo $cmd | grep '=')" ]; then
			 	key=$(echo $cmd | awk -F '=' '{print $1}')
			 	value=$(echo $cmd | awk -F '=' '{print $2}')
			 	eval $key=$value
			 fi
			 
		done

	fi

	QUERY_STRING=""

}
