# Autogenerated from a Treetop grammar. Edits may be lost.


# Treetop grammar for apt-cache policy output
module Policy
  include Treetop::Runtime

  def root
    @root ||= :package_list
  end

  module PackageList0
    def content
      elements.map {|e| e.content}
    end
  end

  def _nt_package_list
    start_index = index
    if node_cache[:package_list].has_key?(index)
      cached = node_cache[:package_list][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_package_entry
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(PackageList0)
    end

    node_cache[:package_list][start_index] = r0

    r0
  end

  module PackageEntry0
    def package_name
      elements[0]
    end

    def installed
      elements[3]
    end

    def candidate
      elements[6]
    end

    def version_table
      elements[8]
    end
  end

  module PackageEntry1
    def content
      {
        :name => elements[0],
        :installed_version => elements[3],
        :candidate_version => elements[6],
        :versions => elements[8].content
      }
    end
  end

  def _nt_package_entry
    start_index = index
    if node_cache[:package_entry].has_key?(index)
      cached = node_cache[:package_entry][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_package_name
    s0 << r1
    if r1
      if has_terminal?(":\n", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure(":\n")
        r2 = nil
      end
      s0 << r2
      if r2
        if has_terminal?("  ", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure("  ")
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_installed
          s0 << r4
          if r4
            if has_terminal?("\n", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("\n")
              r5 = nil
            end
            s0 << r5
            if r5
              if has_terminal?("  ", false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 2))
                @index += 2
              else
                terminal_parse_failure("  ")
                r6 = nil
              end
              s0 << r6
              if r6
                r7 = _nt_candidate
                s0 << r7
                if r7
                  if has_terminal?("\n", false, index)
                    r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure("\n")
                    r8 = nil
                  end
                  s0 << r8
                  if r8
                    r9 = _nt_version_table
                    s0 << r9
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(PackageEntry0)
      r0.extend(PackageEntry1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:package_entry][start_index] = r0

    r0
  end

  module PackageName0
    def content
      text_value
    end
  end

  def _nt_package_name
    start_index = index
    if node_cache[:package_name].has_key?(index)
      cached = node_cache[:package_name][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[a-z0-9_.+-]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(PackageName0)
    end

    node_cache[:package_name][start_index] = r0

    r0
  end

  module Installed0
    def version
      elements[1]
    end
  end

  module Installed1
    def content
      elements[1].content
    end
  end

  def _nt_installed
    start_index = index
    if node_cache[:installed].has_key?(index)
      cached = node_cache[:installed][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("Installed: ", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 11))
      @index += 11
    else
      terminal_parse_failure("Installed: ")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_version
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Installed0)
      r0.extend(Installed1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:installed][start_index] = r0

    r0
  end

  module Candidate0
    def version
      elements[1]
    end
  end

  module Candidate1
    def content
      elements[1].content
    end
  end

  def _nt_candidate
    start_index = index
    if node_cache[:candidate].has_key?(index)
      cached = node_cache[:candidate][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("Candidate: ", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 11))
      @index += 11
    else
      terminal_parse_failure("Candidate: ")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_version
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Candidate0)
      r0.extend(Candidate1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:candidate][start_index] = r0

    r0
  end

  module Version0
  end

  module Version1
  end

  module Version2
    def content
      text_value
    end
  end

  def _nt_version
    start_index = index
    if node_cache[:version].has_key?(index)
      cached = node_cache[:version][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i2, s2 = index, []
    if has_terminal?('\G[0-9]', true, index)
      r3 = true
      @index += 1
    else
      r3 = nil
    end
    s2 << r3
    if r3
      if has_terminal?(":", false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(":")
        r4 = nil
      end
      s2 << r4
    end
    if s2.last
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      r2.extend(Version0)
    else
      @index = i2
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      s5, i5 = [], index
      loop do
        if has_terminal?('\G[a-zA-Z0-9_.~+-]', true, index)
          r6 = true
          @index += 1
        else
          r6 = nil
        end
        if r6
          s5 << r6
        else
          break
        end
      end
      if s5.empty?
        @index = i5
        r5 = nil
      else
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
      end
      s0 << r5
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Version1)
      r0.extend(Version2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:version][start_index] = r0

    r0
  end

  module VersionTable0
  end

  module VersionTable1
    def content
      elements[1..-1].map {|e| e.content}
    end
  end

  def _nt_version_table
    start_index = index
    if node_cache[:version_table].has_key?(index)
      cached = node_cache[:version_table][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("  Version table:\n", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 17))
      @index += 17
    else
      terminal_parse_failure("  Version table:\n")
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_version_table_entry
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(VersionTable0)
      r0.extend(VersionTable1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:version_table][start_index] = r0

    r0
  end

  module VersionTableEntry0
    def version
      elements[1]
    end

    def source_lines
      elements[5]
    end
  end

  module VersionTableEntry1
    def content
      {
        :version => elements[1].content,
        :current => elements[0].content,
        :sources => elements[5].content
      }
    end
  end

  def _nt_version_table_entry
    start_index = index
    if node_cache[:version_table_entry].has_key?(index)
      cached = node_cache[:version_table_entry][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_current_mark
    if r2
      r1 = r2
    else
      r3 = _nt_not_current_mark
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      r4 = _nt_version
      s0 << r4
      if r4
        if has_terminal?(" ", false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(" ")
          r5 = nil
        end
        s0 << r5
        if r5
          s6, i6 = [], index
          loop do
            if has_terminal?('\G[0-9]', true, index)
              r7 = true
              @index += 1
            else
              r7 = nil
            end
            if r7
              s6 << r7
            else
              break
            end
          end
          if s6.empty?
            @index = i6
            r6 = nil
          else
            r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          end
          s0 << r6
          if r6
            if has_terminal?("\n", false, index)
              r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("\n")
              r8 = nil
            end
            s0 << r8
            if r8
              r9 = _nt_source_lines
              s0 << r9
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(VersionTableEntry0)
      r0.extend(VersionTableEntry1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:version_table_entry][start_index] = r0

    r0
  end

  module CurrentMark0
    def content
      true
    end
  end

  def _nt_current_mark
    start_index = index
    if node_cache[:current_mark].has_key?(index)
      cached = node_cache[:current_mark][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?(" *** ", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 5))
      r0.extend(CurrentMark0)
      @index += 5
    else
      terminal_parse_failure(" *** ")
      r0 = nil
    end

    node_cache[:current_mark][start_index] = r0

    r0
  end

  module NotCurrentMark0
    def content
      false
    end
  end

  def _nt_not_current_mark
    start_index = index
    if node_cache[:not_current_mark].has_key?(index)
      cached = node_cache[:not_current_mark][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("     ", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 5))
      r0.extend(NotCurrentMark0)
      @index += 5
    else
      terminal_parse_failure("     ")
      r0 = nil
    end

    node_cache[:not_current_mark][start_index] = r0

    r0
  end

  module SourceLines0
    def content
      elements.map {|e| e.content}
    end
  end

  def _nt_source_lines
    start_index = index
    if node_cache[:source_lines].has_key?(index)
      cached = node_cache[:source_lines][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_source_line
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SourceLines0)
    end

    node_cache[:source_lines][start_index] = r0

    r0
  end

  module SourceLine0
    def priority
      elements[1]
    end

  end

  module SourceLine1
    def content
      {
        :priority => elements[1].content,
        :source => elements[3].content
      }
    end
  end

  def _nt_source_line
    start_index = index
    if node_cache[:source_line].has_key?(index)
      cached = node_cache[:source_line][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?(" ", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      r3 = _nt_priority
      s0 << r3
      if r3
        s4, i4 = [], index
        loop do
          if has_terminal?(" ", false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(" ")
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        if s4.empty?
          @index = i4
          r4 = nil
        else
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        end
        s0 << r4
        if r4
          i6 = index
          r7 = _nt_status_file
          if r7
            r6 = r7
          else
            r8 = _nt_apt_source
            if r8
              r6 = r8
            else
              @index = i6
              r6 = nil
            end
          end
          s0 << r6
          if r6
            if has_terminal?("\n", false, index)
              r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("\n")
              r9 = nil
            end
            s0 << r9
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SourceLine0)
      r0.extend(SourceLine1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:source_line][start_index] = r0

    r0
  end

  module Priority0
    def content
      text_value
    end
  end

  def _nt_priority
    start_index = index
    if node_cache[:priority].has_key?(index)
      cached = node_cache[:priority][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Priority0)
    end

    node_cache[:priority][start_index] = r0

    r0
  end

  module StatusFile0
    def content
      text_value
    end
  end

  def _nt_status_file
    start_index = index
    if node_cache[:status_file].has_key?(index)
      cached = node_cache[:status_file][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("/var/lib/dpkg/status", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 20))
      r0.extend(StatusFile0)
      @index += 20
    else
      terminal_parse_failure("/var/lib/dpkg/status")
      r0 = nil
    end

    node_cache[:status_file][start_index] = r0

    r0
  end

  module AptSource0
    def section
      elements[0]
    end

  end

  module AptSource1
    def arch
      elements[0]
    end

  end

  module AptSource2
    def url
      elements[0]
    end

  end

  module AptSource3
    def content
      text_value
    end
  end

  def _nt_apt_source
    start_index = index
    if node_cache[:apt_source].has_key?(index)
      cached = node_cache[:apt_source][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_url
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?(" ", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(" ")
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        i5, s5 = index, []
        r6 = _nt_section
        s5 << r6
        if r6
          s7, i7 = [], index
          loop do
            if has_terminal?(" ", false, index)
              r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(" ")
              r8 = nil
            end
            if r8
              s7 << r8
            else
              break
            end
          end
          if s7.empty?
            @index = i7
            r7 = nil
          else
            r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          end
          s5 << r7
        end
        if s5.last
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          r5.extend(AptSource0)
        else
          @index = i5
          r5 = nil
        end
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          i10, s10 = index, []
          r11 = _nt_arch
          s10 << r11
          if r11
            s12, i12 = [], index
            loop do
              if has_terminal?(" ", false, index)
                r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure(" ")
                r13 = nil
              end
              if r13
                s12 << r13
              else
                break
              end
            end
            if s12.empty?
              @index = i12
              r12 = nil
            else
              r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
            end
            s10 << r12
          end
          if s10.last
            r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
            r10.extend(AptSource1)
          else
            @index = i10
            r10 = nil
          end
          if r10
            r9 = r10
          else
            r9 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r9
          if r9
            if has_terminal?("Packages", false, index)
              r14 = instantiate_node(SyntaxNode,input, index...(index + 8))
              @index += 8
            else
              terminal_parse_failure("Packages")
              r14 = nil
            end
            s0 << r14
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(AptSource2)
      r0.extend(AptSource3)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:apt_source][start_index] = r0

    r0
  end

  module Url0
  end

  module Url1
    def content
      text_value
    end
  end

  def _nt_url
    start_index = index
    if node_cache[:url].has_key?(index)
      cached = node_cache[:url][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[a-z]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      if has_terminal?("://", false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure("://")
        r3 = nil
      end
      s0 << r3
      if r3
        s4, i4 = [], index
        loop do
          if has_terminal?('\G[^ ]', true, index)
            r5 = true
            @index += 1
          else
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        if s4.empty?
          @index = i4
          r4 = nil
        else
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Url0)
      r0.extend(Url1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:url][start_index] = r0

    r0
  end

  module Section0
  end

  module Section1
    def content
      text_value
    end
  end

  def _nt_section
    start_index = index
    if node_cache[:section].has_key?(index)
      cached = node_cache[:section][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[a-z-]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      if has_terminal?("/", false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("/")
        r3 = nil
      end
      s0 << r3
      if r3
        s4, i4 = [], index
        loop do
          if has_terminal?('\G[a-z-]', true, index)
            r5 = true
            @index += 1
          else
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        if s4.empty?
          @index = i4
          r4 = nil
        else
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Section0)
      r0.extend(Section1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:section][start_index] = r0

    r0
  end

  module Arch0
    def content
      text_value
    end
  end

  def _nt_arch
    start_index = index
    if node_cache[:arch].has_key?(index)
      cached = node_cache[:arch][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[a-zA-Z0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Arch0)
    end

    node_cache[:arch][start_index] = r0

    r0
  end

end

class PolicyParser < Treetop::Runtime::CompiledParser
  include Policy
end

# vim: filetype=ruby
