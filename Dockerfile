FROM ruby:1.9.3

WORKDIR /root

RUN gem install ruby-progressbar
RUN gem install command_line_reporter -v 3.3.6
RUN gem install ruby-hl7

COPY . /root

CMD ["bash"]
