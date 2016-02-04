partial_data_with_labels.csv: LINES=100000
partial_data_with_labels.csv: only_names.csv kddcup.data
	cp only_names.csv tmp
	head -n ${LINES} kddcup.data >> tmp
	mv tmp partial_data_with_labels.csv

data_with_labels.csv: only_names.csv kddcup.data
	cp only_names.csv tmp
	cat kddcup.data >> tmp
	mv tmp data_with_labels.csv

only_names.csv: kddcup.names
	./reformat_names.py kddcup.names only_names.csv

kddcup.data:
	curl -O http://kdd.ics.uci.edu/databases/kddcup99/kddcup.data.gz
	gunzip kddcup.data.gz

kddcup.names:
	curl -O http://kdd.ics.uci.edu/databases/kddcup99/kddcup.names

clean:
	rm partial_data_with_labels.csv data_with_labels.csv || true
