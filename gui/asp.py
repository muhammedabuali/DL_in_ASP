import subprocess
import os
from subprocess import Popen, PIPE, STDOUT
target = '../temp.lp'

def run_query(params):
    input = params_to_input(params)
    gen_query(input)
    result = run_command()
    out = parse_output(result)
    return out

def parse_output(result):
    sp = result.split("\n")
    print(sp)
    i = sp.index("SATISFIABLE")
    l = sp[i-1]
    values = l.split(" ")
    res = {}
    for v in values:
        parts = v.split("(")
        k = parts[0]
        if len(parts) > 1:
            param = parts[1][:-1]
            params = param.split(",")
            print(parts)
            print(params)
            if len(params) > 1 and len( params[1] ) > 1 and len(params[1]) < 4:
                if len(params) > 2:
                    if k in res and len(res[k]) > 2:
                        res[k][2] = res[k][2] + [ params[2] ]
                    else:
                        res[k] = [params[0], params[1], [ params[2] ], params[3]]
                else:
                    res[k] = [params[0], params[1]]
            else:
                if k in res:
                    pass
                else:
                    if len(params) > 2:
                        res[k] = [params[0], 0, [ params[2] ], params[3]]
                    elif len(params) > 1:
                        res[k] = [params[0], 0, params[1]]
                    else:
                        res[k] = params[0]
        else:
            if k in res:
                pass
            else:
                res[k] = k
        print(res[k])
    print("{***************")
    print ( res )
    return res



def gen_query(input):
    data = ""
    with open('../query.lp') as f:
        data = f.read()
        data += "\n".join(input)
    print(data)
    with open(target, 'w+') as f:
        f.write(data)

def run_command():
    cmd = 'clingo ' + target
    p = Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
    output = p.stdout.read().decode()
    os.remove(target)
    return output

def params_to_input(params):
    features = params["conceptFeatures"]\
    + params["roleFeatures"]
    extra_lines = []
    for f in features:
        l = "target_feature("\
        +f+")."
        extra_lines.append(l)
    extra_lines.append(
        "target_box("+\
        params["tboxType"]+\
        ")."
    )
    if params["finiteReasoning"]:
        extra_lines.append("reasoning(finite).")
    else:
        print("********************")
        print(params)
        print("********************")
        extra_lines.append("reasoning(normal).")
    return extra_lines
