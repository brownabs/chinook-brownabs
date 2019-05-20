--Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

 SELECT count(pt.TrackId) TRACS, pt.PlaylistId, p.Name
FROM Playlist p
JOIN PlaylistTrack pt on p.PlaylistId = pt.PlaylistId
group by pt.PlaylistId, p.Name
