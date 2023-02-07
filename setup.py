import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name='toolbox',
    version='0.0.3',
    author='Mike Huls',
    author_email='bhoover8160@gmail.com',
    description='Testing installation of Package',
    long_description=long_description,
    long_description_content_type="text/markdown",
    url='https://github.com/bhoover59/PythonScripts',
    project_urls = {
        "Bug Tracker": "https://github.com/bhoover59/PythonScripts"
    },
    license='MIT',
    packages=['toolbox'],
    install_requires=['requests'],
)
