SELECT DISTINCT( m.musician_name )
FROM 
	musician as m,
	instrument as i,
	musician_instrument as p,
	album as a
WHERE 
	m.musician_ssn = p.musician_ssn AND
	i.instrument_id = p.instrument_id AND
	i.instrument_name = 'Flute' AND
	EXISTS (
		SELECT m.musician_name
		FROM musician as m, instrument as i, musician_instrument as p
		WHERE
			m.musician_ssn = p.musician_ssn AND
			i.instrument_id = p.instrument_id AND
			i.instrument_name = 'Guitar' AND
			a.producer_ssn IN (
				SELECT producer_ssn 
				FROM album
				WHERE no_of_songs >= (
					SELECT AVG(no_of_songs)
					FROM album
					
				)
			)

		
	)
