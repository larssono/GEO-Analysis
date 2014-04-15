#! /usr/bin/env python

### Imports of import
import argparse

### Load input parameters

### Functions

def parse_args():
    parser=argparse.ArgumentParser(description='Saves a file to Synapse and creates the relevant provenance record.",')
    parser.add_argument("-pn", metavar="PROJECT_NAME")
    parser.add_argument("-fn", metavar="FOLDER_NAME")
    parser.add_argument("-ep", metavar="ENTITY_PATH", type=argparse.FileType('r'))
    parser.add_argument("-ed", metavar="ENTITY_DESCRIPTION")
    parser.add_argument("-an", metavar="ACTIVITY_NAME")
    parser.add_argument("-ad", metavar="ACTIVITY_DESCRIPTION")
    parser.add_argument("-progn", metavar="PROGRAM_NAME")
    parser.add_argument("-progv", metavar="PROGRAM_VERSION")
    parser.add_argument("files", nargs=argparse.REMAINDER, metavar="FILES_USED")

    
    parser.add_argument("C", nargs=argparse.REMAINDER)
    
    return parser.parse_args()


def main():
	args = parse_args()
	print "Project Name: " + str(args.pn)
	print "Folder Name: " + str(args.fn)
	print "Entity Path: " + str(args.ep)
	print "Entity Description: " + str(args.ed)
	print "Activity Name: " + str(args.an)
	print "Activity Description: " + str(args.ad)
	print "Program Name: " + str(args.progn)
	print "Program Ver: " + str(args.progv)
	print "Files Used: " + str(args.files)
	
main()

