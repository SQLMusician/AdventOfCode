#!/usr/bin/env python3
#
def traverse(val, tree):
     if 'no other' in val:
         return False
     if 'shiny gold' in val:
         return True
     return any([traverse(tree[i], tree) for i in val])


with open('data.txt') as _file:
     tree = {}
     tally = 0
     for line in _file:
         rule = line.replace("bags", "").replace("bag", "").replace(".", "").rstrip().split("  contain ")
         tree[rule[0]] = [l.lstrip() for l in''.join(letter for letter in rule[1] if letter.isalpha() or letter == " ").rstrip().split("  ")]
     for value in tree.values():
         if traverse(value, tree):
             tally += 1
     print("Part 1", tally)
