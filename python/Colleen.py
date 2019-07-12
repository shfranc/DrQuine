# Colleen
def main():
    # print source code
    code = '# Colleen\ndef main():\n    # print source code\n    code = {0!r}\n    print(code.format(code))\n\nif __name__ == "__main__":\n    main()'
    print(code.format(code))

if __name__ == "__main__":
    main()
