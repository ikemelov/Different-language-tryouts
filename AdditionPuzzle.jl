using Random

function main()
	NUMS = Get_NUMS()
	WIDE = Get_WIDE()
	VARI = Get_VARI(WIDE)
	println("\n")
	
	
	max = Max_Wide(WIDE)
	
	while true
		global limit = limitSet(WIDE)
		global arr = Get_T_Nums(limit,NUMS,WIDE)
		global t_sum = Get_Sum(arr, NUMS)

		if t_sum < max
			break
		end
	end

	arr_letters = Get_Letters(WIDE)

	dict1 = Dict()
	
	letters_arr = collect(arr_letters)
	limit1 = copy(limit)
	limit2 = collect(limit1)

	for i in 1:WIDE
		dict1[limit2[i]]  = letters_arr[i]
	end

	arr3 = []

	for i in 1:NUMS
		for j in 1:WIDE
			for w in 1:WIDE
				if (arr[i][j] == limit2[w])
					push!(arr3, dict1[arr[i][j]])				
				end
			end
		end
	end

	#printing to the screen
	Print_Result(WIDE,NUMS,arr3,t_sum)

	#asking a question
	
	while  true
		print(" ")
		REVE = Get_Revealed(WIDE)
		arr3 = dict_REVE(WIDE,letters_arr,limit2,arr3, REVE)
		Print_Result(WIDE,NUMS,arr3,t_sum)
		
		if (REVE == WIDE || REVE > WIDE)
			println("	THE END!")
			break
		end
	end
	
end

function Get_NUMS()
	print("How many numbers? : ")
	return NUMS = parse(Int,readline())
end

function Get_WIDE()
	print("How many digits wide? : ")
	return WIDE = parse(Int,readline())
end

function Get_VARI(WIDE)
	print("How many variables? : ")
	VARI = parse(Int,readline())
	if(VARI > WIDE)
		println(" ")
		println("Can't have more variables than there are unique digits.")
		print("Please, enter a number less than digits wide: ")
		VARI = parse(Int,readline())
		println(" ")
	end
	return VARI
end

function Get_Revealed(WIDE)
	print("Too hard? Want to reveal a digit? How many? : ")
	REVE = parse(Int,readline())
	if(REVE > WIDE)
		println(" ")
		println("Can't reveal more digits than there are digits wide.")
		print("Please, enter a number less than digits wide: ")
		REVE = parse(Int,readline())
		println(" ")
	end
	return REVE
end

function Max_Wide(WIDE)
	return max = parse(Int,join(rand(9:9,WIDE)))
	println(max)
end

function limitSet(WIDE)
	limit = Set()
	while length(limit) < WIDE
		push!(limit, rand(1:9))
	end
	return limit
end

function Get_T_Nums(limit,NUMS,WIDE)
	arr = []
	for i in 1:NUMS
		push!(arr,rand(limit, WIDE))
	end
	return arr
end 

function Get_Sum(arr,NUMS)
	nums = 0
	for i in 1:NUMS
		nums += (parse(Int,join(arr[i])))
	end
	return nums
end

function Get_Letters(WIDE)
	arr_letters = Set()
	return arr_letters = rand('a':'z',WIDE)
end

function Print_Result(WIDE,NUMS,arr3,t_sum)
	h = 1
	for i in 1:NUMS
		print("		")
		for j in 1:WIDE
			print(arr3[h])
			h+=1
		end
		println(" ")
	end

	println(" ")
	print("	  +")
	
	k =0
	while k < (NUMS + 3)
		print("-")
		k+=1
	end
	println(" ")
	println("		",t_sum)
	println(" ")
end

function dict_REVE(WIDE,letters_arr,limit2, arr3, REVE)

	for i in 1:REVE
		replace!(arr3, letters_arr[i] => limit2[i] )
	end

	return arr3
end

main()
