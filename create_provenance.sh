#! /usr/bin/env python

### Imports of import
import argparse
import io
import synapseclient
from synapseclient import Activity
from synapseclient import Entity, Project, Folder, File

### Load input parameters

### Functions

def parse_args():
    parser=argparse.ArgumentParser(description='Saves a file to Synapse and creates the relevant provenance record.",')
    parser.add_argument("-pn", metavar="PROJECT_NAME")
    parser.add_argument("-fn", metavar="FOLDER_NAME")
    parser.add_argument("-ep", metavar="ENTITY_PATH")#, type=argparse.FileType('r'))
    parser.add_argument("-ed", metavar="ENTITY_DESCRIPTION")
    parser.add_argument("-an", metavar="ACTIVITY_NAME")
    parser.add_argument("-ad", metavar="ACTIVITY_DESCRIPTION")
    parser.add_argument("-progn", metavar="PROGRAM_NAME")
    parser.add_argument("-progv", metavar="PROGRAM_VERSION")
    #parser.add_argument("-store_in_synapse")
    parser.add_argument("files", nargs=argparse.REMAINDER, metavar="FILES_USED")

    
    parser.add_argument("C", nargs=argparse.REMAINDER)
    
    return parser.parse_args()

### Provenance code

def get_project_store(syn, project_name):
    project=Project(project_name)
    project_store=syn.store(project)
    return project_store

def get_simple_folder_store(syn, project_store, folder_name):
    folder = Folder(folder_name,project_store)
    folder_store =syn.store(folder)  
    return folder_store
    
def get_folder_store(syn, project_store, folder_name):
    lst_folder = folder_name.split("/")
    parent = project_store
    for folder_name in lst_folder:
        folder_store = get_simple_folder_store(syn, parent, folder_name)
        parent = folder_store
    return folder_store

def save_file_to_synapse(syn, syn_folder, args):
    file_path = str(args.ep)
    file_entity = File(file_path, description=args.ed, parent=syn_folder, synapseStore=False)
    file_entity = syn.store(file_entity)
    return file_entity
    
def make_activity(args):
    act = Activity(name=args.an, description=args.ad)
    return act
        
### used for testing
def display_test(syn,entity):
    print "Found " + str(entity.properties.id)

### main
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
	#print "Store in Synapse: " + str(args.store_in_synapse)
	
	syn = synapseclient.Synapse()
	syn.login()
	
	project = get_project_store(syn, args.pn)
	folder = get_folder_store(syn, project, args.fn)
	file = save_file_to_synapse(syn, folder, args)
	activity = make_activity(args)
	file = syn.store(file, activity=activity)
	
	#Test
	display_test(syn,project)
	display_test(syn,folder)
	display_test(syn,file)
	
### Running code
	
main()

