class NotesController < ApplicationController

  def index
    slide_id = params[:s]
    pagenum = params[:p]

    notes = Note.where("user_id = ? AND slide_id = ? AND pagenum = ?", current_user.id, slide_id, pagenum)
    render json: notes
  end

  def create
    user_id = current_user.id
    slide_id = params[:note][:slide_id]
    pagenum = params[:note][:pagenum]

    newnote = Note.create(user_id: user_id,
              slide_id: slide_id,
              pagenum: pagenum,
              top: params[:note][:top],
              left: params[:note][:left],
              width: 100,
              height: 50,
              content: params[:note][:content])
    render json: newnote
  end

  def update
    note = Note.find(params[:id])
    if note
      note.update_attributes(top: params[:note][:top],
                  left: params[:note][:left],
                  width: params[:note][:width],
                  height: params[:note][:height],
                  content: params[:note][:content])
      render json: {"success" => true}
    else
      render json: {"success" => false}
    end
  end

  def destroy
    Note.destroy(params[:id])
    render json: {"success" => true}
  end

end
