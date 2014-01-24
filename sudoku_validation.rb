seq1 = %w{2 3 5 1 4 7 9 8 6}
seq2 = %w{4 1 8 9 6 5 7 2 3}
seq3 = %w{6 9 4 2 8 3 1 4 5}
seq4 = %w{9 8 6 5 7 4 2 3 1}
seq5 = %w{5 7 3 8 1 2 4 6 9}
seq6 = %w{1 4 2 6 3 9 8 5 7}
seq7 = %w{7 5 9 3 2 8 6 1 4}
seq8 = %w{8 6 4 7 5 1 3 9 2}
seq9 = %w{3 2 1 4 9 6 5 7 8}

sudoku = [seq1, seq2, seq3, seq4, seq5, seq6, seq7, seq8, seq9]

# Horizontal validation
sudoku.each do |seq|
	if seq.uniq.length != 9
		print "duplicate number in horizontal sequence for #{seq}\n"
	end
end

# Vertical validation
vertical_sudoku = []
9.times do |idx|
	vertical_seq = []

	sudoku.each_index do |i|
		vertical_seq << sudoku[i][idx]
	end

	vertical_sudoku << vertical_seq
end

vertical_sudoku.each do |seq|
	if seq.uniq.length != 9
		print "duplicate number in vertical sequence for #{seq}\n"
	end
end

# Box validation
box_range = [0..2, 3..5, 6..9]

box_range.each do |range|

	rows = sudoku[range]
	box_range.each do |range|
	
		box = []
		rows.each do |row|
			box << row[range]
		end

		if box.flatten.uniq.length != 9
			print "duplicate number in box sequence for #{box.flatten}\n"
		end
	end
end
