class UrlParser
  def initialize(url)
    @new_url = url
    @split_url = @new_url.split("://")
    @base_url = @split_url[1]
  end
  def scheme
    @split_url[0]
  end
    def domain
      domain_start = @base_url.split("/")[0]
      if domain_start.include? ":"
      domain_start.split(":")[0]
    else
      domain_start = @base_url
      end
    end
    def port
      if @base_url.include? ":"
        port = @base_url.split(":")[1].split("/")[0]
      elsif scheme == "http"
        "80"
      elsif scheme == "https"
         "443"
      end
    end
    def path
        if @base_url.include? "/"
            if @base_url.include? "?"
               path_start = @base_url.split("/")[1].split("?")[0]
            elsif @base_url.include? "#"
                path_start = @base_url.split("/")[1].split("#")[0]
              end
              path_start = @base_url.split("/")[1] # the fix to the problem
            else
                path_start == "" ? nil : path_start

        end
    end
    def query_string
      myhash = { }
      if @base_url.include? "?"
        q_start = @base_url.split("?")[1].split("#")[0].split("&")
        q_start.each do |key|
          split_1 = key.split("=")[0]
          split_2 = key.split("=")[1]
          myhash[split_1] = split_2
         end
      end
      myhash
    end
    def fragment_id
      frag_out = @base_url.split("#")[1]
    end

end
