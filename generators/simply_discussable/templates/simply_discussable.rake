#	From `script/generate simply_discussable` ...
unless Gem.source_index.find_name('jakewendt-simply_discussable').empty?
	gem 'jakewendt-simply_discussable'
	require 'simply_discussable/test_tasks'
end
