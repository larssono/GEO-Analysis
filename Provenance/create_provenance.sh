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
    parser.add_argument("-en", metavar="ENTITY_NAME")
    parser.add_argument("-an", metavar="ACTIVITY_NAME")
    parser.add_argument("-ad", metavar="ACTIVITY_DESCRIPTION")
    parser.add_argument("-progn", metavar="SYN_ID_OF_PROGRAM", nargs='+')
    parser.add_argument("-progv", metavar="SYN_VER_OF_PROGRAM", nargs='+')
    parser.add_argument("-upload", action='store_true')
    parser.add_argument("-uses", metavar="FILES_USED", nargs='+')
    
    return parser.parse_args()

### Provenance code

def get_project_ent(syn, project_name):
    ROOT_ID='syn4489'
    project_id = syn._findEntityIdByNameAndParent(project_name, ROOT_ID)
    project_ent = syn.get(project_id)
    return project_ent

def get_simple_folder_ent(syn, parent_ent, folder_name):
	#Gets folder by name, based on parent.
	#If folder does not exist, it makes the folder
    ent_ID = syn._findEntityIdByNameAndParent(folder_name, parent_ent)
    if ent_ID == None:
        folder = Folder(folder_name, parent_ent)
        folder_ent =syn.store(folder) 
    else:
        folder_ent = syn.get(ent_ID)
    return folder_ent
    
def get_folder_ent(syn, project_ent, folder_name):
	#Traverses down the path to find the folder entity
    lst_folder = folder_name.split("/")
    parent = project_ent
    for folder_name in lst_folder:
        folder_ent = get_simple_folder_ent(syn, parent, folder_name)
        parent = folder_ent
    return folder_ent
    
def get_file_ent(syn, folder_ent, file_name):
    ent_ID = syn._findEntityIdByNameAndParent(file_name, folder_ent)
    file_ent = syn.get(ent_ID, downloadFile=False)
    return file_ent

def save_file_to_synapse(syn, syn_folder, args):
    file_path = str(args.ep)
    if args.upload: print "uploading " + file_path
    file_entity = File(file_path, name=args.en, description=args.ed, parent=syn_folder, synapseStore=args.upload)
    file_entity = syn.store(file_entity)
    return file_entity

def parse_file_path(file_path):
    lst = file_path.split("/")
    
    dir_="/".join(lst[:-1])
    file_name=lst[-1]
    return dir_, file_name

def process_uses(syn, args, project_ent, act):
    if args.uses != None:
		for file_path in args.uses:
			syn_dir, file_name = parse_file_path(file_path)
			folder_ent = get_folder_ent(syn, project_ent, syn_dir)
			file_ent = get_file_ent(syn, folder_ent, file_name)
			act.used(file_ent)
        
def load_executed_files(syn, args, act):
    if args.progn != None:
        pairs = zip(args.progn, args.progv)
        for (syn, ver) in pairs:
            act.used(target=syn,targetVersion=ver,wasExecuted=True)
        
def make_activity(syn, args, project_ent):
    act = Activity(name=args.an, description=args.ad)
    load_executed_files(syn, args, act)
    process_uses(syn, args, project_ent, act)
    return act
        
### used for testing
def display_test(entity_desc, entity):
    print entity_desc + ": " + str(entity.properties.id)

### main
def main():
	args = parse_args()
	print "* PARAMETERS USED IN create_provenance"
	print "* Project Name: " + str(args.pn)
	print "* Folder Name: " + str(args.fn)
	print "* Entity Name: " + str(args.en)
	print "* Entity Path: " + str(args.ep)
	print "* Entity Description: " + str(args.ed)
	print "* Activity Name: " + str(args.an)
	print "* Activity Description: " + str(args.ad)
	print "* Program Name(s): " + str(args.progn)
	print "* Program Ver(s): " + str(args.progv)
	print "* File(s) Used: " + str(args.uses)
	print "* Upload?: " + str(args.upload)
	
	syn = synapseclient.Synapse()
	syn.login()
	
	syn_project = get_project_ent(syn, args.pn)
	syn_folder = get_folder_ent(syn, syn_project, args.fn)
	syn_file = save_file_to_synapse(syn, syn_folder, args)
	syn_activity = make_activity(syn, args, syn_project)
	syn_file = syn.store(syn_file, activity=syn_activity)

	#Test
	display_test("project",syn_project)
	display_test("folder",syn_folder)
	display_test("file",syn_file)
	
### Running code
	
main()

