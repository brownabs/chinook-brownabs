-- Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT t.Name Track, a.Title AlbumName, g.Name Genre, mt.Name MediaType
FROM Track t
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
