-- RENAME TABLE track TO song_track;

SELECT 
	customer.LastName, 
    customer.FirstName,
    customer.CustomerId,
    invoice.CustomerId,
    invoice.InvoiceId,
    invoiceline.InvoiceId,
    invoiceline.trackid
FROM customer
    INNER JOIN customer.customerif ON s.id = b.sid
    INNER JOIN course c ON b.cid  = c.id 
ORDER BY s.name 

SELECT
	customer.LastName, 
    customer.FirstName,
    customer.CustomerId,
    invoice.CustomerId,
    invoice.InvoiceId,
    invoiceline.InvoiceId,
    invoiceline.trackid,
    song_track.Name,
    song_track.AlbumId,
    album.AlbumId,
    album.Title
    FROM customer
    JOIN invoice
		ON customer.CustomerId = invoice.CustomerId
	JOIN invoiceline
		ON invoice.InvoiceId = invoiceline.InvoiceId
	JOIN song_track
		ON invoiceline.TrackId = song_track.TrackId
	JOIN Album
		ON song_track.AlbumId = Album.AlbumId;

/* SELECT
		UserName,
        groups.GroupName,
        rooms.RoomName
        FROM users
        LEFT JOIN groups
			on users.FK_Group = groups.PK_Group
		LEFT JOIN rooms
			on users.FK_Group = rooms.FK_Group
			ORDER BY users.UserName, groups.GroupName, rooms.RoomName; */