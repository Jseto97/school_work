import check

## Question 2

# is_html_code: string -> bool

# Purpose: produces a bool expression by consuming the given
# string (s)

# Effect: no effect since there is no mutation

# Examples: is_html_code("") => False
# is_html_code("HEADING") => True
# is_html_code("<html></html>") => False
# is_html_cede("<h1>HEADING</h1>") => True
# is_html_code("<h1>HEAD</h1>") => False

def is_html_code(s):
    L = len(s)
    if s == "HEADING":
        return True
    if s[:6] == "<html>" and s[-7:] == "</html>":
        return is_html_code(s[6:L-7])
    if s[:4] =="<h1>" and s[-5:] == "</h1>":
        return is_html_code(s[4:L-5])
    else: 
        return False 
            

# Tests
## base case
check.expect("q2t1", is_html_code(""), False)
## single element cases
check.expect("q2t2", is_html_code("HEADING"), True)
check.expect("q2t3", is_html_code("<html></html>"), False)
check.expect("q2t4", is_html_code("<h1></h1>"), False)
## short combined cases
check.expect("q2t5", is_html_code("<h1>HEADING</h1>"), True)
check.expect("q2t6", is_html_code("<html>HEADING</html>"), True)
check.expect("q2t7", is_html_code("<h1>HEAD</h1>"), False)
## long combined cases
check.expect("q2t8", is_html_code("<html><h1><html>HEADING</html></h1></html>"),\
True)
check.expect("q2t9", is_html_code("<html><html>HEADING</html></html>"), True)
check.expect("q2t10", is_html_code("<html>HEADING</html></h1></html>"), False)