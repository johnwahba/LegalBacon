p "running"
count = Opinion.count
Opinion.all.each_with_index do |opinion, idx|
	paragraph = opinion.paragraphs.first 
	paragraph.start_of_opinion = true
	paragraph.save!

	if idx % 1000 == 0
		p idx.to_s + "/" + count.to_s
	end

end
