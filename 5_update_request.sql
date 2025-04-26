create or alter PROCEDURE pokequeue.create_poke_request(
    @type NVARCHAR(255),
    @samplesize INT = NULL
)
AS 

SET NOCOUNT ON;

insert into pokequeue.requests(
    [type]
    , [url]
    , [samplesize]
    , id_status
) values(
    @type
    , ''
    , @samplesize
    , ( select id from pokequeue.status where description = 'sent' )
)

select max(id) as id from pokequeue.requests;

