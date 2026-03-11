project('sysmon', 'vala')

gnome = import('gnome')

resources = gnome.compile_resources(
    'sysmon-resources',
    'resources/sysmon.gresource.xml',
    source_dir: '.'
)

my_panel_proj = subproject('my_panel_lib')
my_panel_dep = my_panel_proj.get_variable('my_panel_dep')

src = [
    'src/main.vala'
]

deps = [
    my_panel_dep
]

executable(
    'sysmon',
    src,
    resources,
    dependencies: deps
)

