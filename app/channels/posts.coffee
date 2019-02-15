jQuery(document).on 'turbolinks:load', ->
    comments = $('#comments')
    if comments.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: PostsChannnel
            post_id: comments.data('post-id')
        },
        connected: ->
        disconnected: ->
        recieved: (data) ->
            comments.append data['comment']
        send_comment: (comment, post_id) ->
            @perform 'send_comment', comment: comment, post_id: post_id
    $('#new_comment').submit (e) ->
        $this = $(this)
        textarea = $this.find('#comment_content')
        if $.trim(textarea.val()).length > 1 
            App.global_chat.send_comment textarea.val(),
            comments.data('post-id')
            textarea.val('')
        e.preventDefault()
        return false