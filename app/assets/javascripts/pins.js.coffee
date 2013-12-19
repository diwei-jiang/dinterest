jQuery ->
    $('#pins').imagesLoaded ->
        $('#pins').masonry itemSelector: ".box"