/* SCENARIO: A digital music store wishes to promote certain songs and artists on the front page of their website based on sales or popularity. 
They want the following lists promoted:
- top 100 songs
- top 10 artists
- top 10 songs in UK
- top 10 songs in last 6 months
*/

-- Finding top 100 songs by units sold
SELECT track.name AS "Track", artist.name AS "Artist"
FROM track
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN invoice_line ON track.track_id = invoice_line.track_id
GROUP BY track.track_id, track.name, artist.name
ORDER BY SUM(invoice_line.quantity) DESC
LIMIT 100;

-- Finding top 10 artists by units sold
SELECT artist.name AS "Artist"
FROM track
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN invoice_line ON track.track_id = invoice_line.track_id
GROUP BY artist.name
ORDER BY SUM(invoice_line.quantity) DESC
LIMIT 10;

-- Finding top 10 tracks in UK by units sold
SELECT track.name AS "Track", artist.name AS "Artist"
FROM track
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN invoice_line ON track.track_id = invoice_line.track_id
JOIN invoice ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice.billing_country = 'United Kingdom'
GROUP BY track.track_id, track.name, artist.name
ORDER BY SUM(invoice_line.quantity) DESC
LIMIT 10;

-- Finding top 10 songs in last 6 months by units sold
