class CodeHtmlRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
        return Pygments.highlight(code, lexer: language, timeout: 4)
    end
end