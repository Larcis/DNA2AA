lst = "UCAG"
aas = "FLSYCWLPHQRIMTNKSRVADEG--"
aa_range = [
	[0, 1],
	[2, 3],
	[4, 7],
	[8,9],
	[12,13],
	[15,15],
	[16,19],
	[20,23],
	[24,25],
	[26,27],
	[28,31],
	[32,34],
	[35,35],
	[36,39],
	[40,41],
	[42,43],
	[44,45],
	[46,47],
	[48,51],
	[52,55],
	[56,57],
	[58,59],
	[60,63],
	[10,11],
	[14,14]
]

for i in range(4):
	for j in range(4):
		for k in range(4):
			count = 0
			for l in aa_range:
				val = i * 16 + j *4 + k
				if(l[0]<= val <=l[1]):
					break;
				count += 1
			print('"%s%s%s" => "%s",' %(lst[i],lst[j],lst[k], aas[count]))