require "idobata_graph_ql"

class IdobataFs
  def contents(path)
    _, org, room_name = path.split(?/, 3)

    if org.empty?
      organizations
    elsif organizations.include?(org) && room_name.nil?
      room_names
    end
  end

  def directory?(path)
    _, org, room_name = path.split(?/, 3)
    organizations.include?(org) && room_name.nil?
  end

  def file?(path)
    room_for(path)
  end

  def can_write?(path)
    file?(path)
  end

  def write_to(path, body)
    return if body.empty?
    IdobataGraphQL.create_message(room_for(path).id, <<~BODY)
    ~~~
    #{body}
    ~~~
    BODY
  end

  private

  def room_for(path)
    _, org, room_name = path.split(?/, 3)
    rooms.detect { |r| r.organization == org && r.name == room_name }
  end

  def organizations
    @organizations ||= rooms.map(&:organization).uniq
  end

  def room_names
    @room_names ||= rooms.map(&:name)
  end

  def rooms
    @rooms ||= IdobataGraphQL.rooms
  end
end
