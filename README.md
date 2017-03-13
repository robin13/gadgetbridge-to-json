gadgetbridge-to-json
====================

A perl script to convert a gadgetbridge sqlite database into json.
The file produced will have one json document per line as suitable to 
ingest into elasticsearch using logstash.

## Usage

./gadgetbridge-to-json.pl --db <path-to-db> --output <path-to-json-file>
